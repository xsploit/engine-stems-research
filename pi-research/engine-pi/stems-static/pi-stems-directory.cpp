// Local experiment: correct only Engine's processor-directory filter.
// No firmware code or keys. Requires explicit ENGINE_LAB_STEMS_MOUNT opt-in.
#include <QDir>
#include <QFileInfo>
#include <dlfcn.h>
#include <cstdio>
#include <cstdlib>

QStringList QDir::entryList(Filters filters, SortFlags sort) const {
    using Original = QStringList (*)(const QDir*, Filters, SortFlags);
    static const auto original = reinterpret_cast<Original>(dlsym(RTLD_NEXT,
            "_ZNK4QDir9entryListE6QFlagsINS_6FilterEES0_INS_8SortFlagEE"));
    if (!original) {
        std::fputs("pi-stems-directory: original Qt entryList unavailable\n", stderr);
        std::abort();
    }
    const auto target = qEnvironmentVariable("ENGINE_LAB_STEMS_MOUNT");
    if (!target.isEmpty() && QDir::isAbsolutePath(target) &&
            absolutePath() == target && int(filters) == 0x6000 && int(sort) == -1) {
        const QFileInfo launcher(filePath("stems-processor"));
        const QFileInfo processor(filePath("stems-processor.real"));
        const QFileInfo dispatcher(filePath("libNNPredictionDispatcher_on.so"));
        if (launcher.isFile() && launcher.isExecutable() &&
                processor.isFile() && processor.isExecutable() && dispatcher.isFile()) {
            filters |= QDir::AllEntries;
        }
    }
    return original(this, filters, sort);
}
