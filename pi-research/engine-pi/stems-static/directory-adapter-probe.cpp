#include <QCoreApplication>
#include <QDir>
#include <QFile>
#include <QTemporaryDir>
#include <iostream>
#include <stdexcept>

static void check(bool ok, const char* label) {
    if (!ok) throw std::runtime_error(label);
    std::cout << "PASS " << label << std::endl;
}
static void populate(const QString& path) {
    for (const char* name : {"stems-processor", "stems-processor.real",
                            "libNNPredictionDispatcher_on.so"}) {
        QFile f(QDir(path).filePath(QString::fromLatin1(name)));
        check(f.open(QIODevice::WriteOnly), "create synthetic file");
        f.write("synthetic test data, never executed");
        f.close();
        check(f.setPermissions(QFile::ReadOwner | QFile::WriteOwner | QFile::ExeOwner),
                "set synthetic permissions");
    }
}
static qsizetype entries(const QString& path, int filter = 0x6000, int sort = -1) {
    return QDir(path).entryList(QDir::Filters(filter), QDir::SortFlags(sort)).size();
}
int main(int argc, char** argv) {
    QCoreApplication app(argc, argv);
    QTemporaryDir target, unrelated;
    check(target.isValid() && unrelated.isValid(), "temporary directories");
    populate(target.path()); populate(unrelated.path());
    qunsetenv("ENGINE_LAB_STEMS_MOUNT");
    check(entries(target.path()) == 0, "disabled by default");
    qputenv("ENGINE_LAB_STEMS_MOUNT", target.path().toUtf8());
    check(entries(target.path()) == 3, "exact target sees real entries");
    check(entries(unrelated.path()) == 0, "unrelated directory unchanged");
    check(entries(target.path(), 0x6001) == 0, "other filter unchanged");
    check(entries(target.path(), 0x6000, 0) == 0, "other sort unchanged");
    check(entries(target.path(), 0x6007) == 3, "normal listing unchanged");
    check(QFile::remove(QDir(target.path()).filePath("stems-processor.real")),
            "remove synthetic component");
    check(entries(target.path()) == 0, "incomplete adapter not accepted");
    qputenv("ENGINE_LAB_STEMS_MOUNT", "relative/path");
    check(entries(target.path()) == 0, "relative opt-in rejected");
    return 0;
}
