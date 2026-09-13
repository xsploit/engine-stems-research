#include <QCoreApplication>
#include <QDir>
#include <QFile>
#include <QFileInfo>
#include <QTemporaryDir>
#include <iostream>
int main(int argc,char **argv) {
 QCoreApplication app(argc,argv);
 QFileInfo package("/content/stems-child-process.sqsh.signed");
 const auto target=QString("/secure-media/")+package.completeBaseName();
 QTemporaryDir tmp;
 if(!tmp.isValid())return 1;
 QDir dir(tmp.path());
 const auto flags=QDir::Filters(0x6000);
 const auto empty=dir.entryList(flags,QDir::SortFlags(-1)).size();
 QFile worker(dir.filePath("stems-processor"));
 if(!worker.open(QIODevice::WriteOnly))return 2;
 worker.write("synthetic placeholder");worker.close();
 dir.refresh();
 const auto populated=dir.entryList(flags,QDir::SortFlags(-1)).size();
 const auto control=dir.entryList(flags|QDir::AllEntries,QDir::SortFlags(-1)).size();
 std::cout<<"Qt "<<qVersion()<<" suffix="<<package.suffix().toStdString()
 <<" target="<<target.toStdString()<<" empty_entries="<<empty
 <<" populated_entries="<<populated<<" all_entries_control="<<control<<std::endl;
 return package.suffix()=="signed" && target=="/secure-media/stems-child-process.sqsh" && empty==0 && populated==0 && control==1 ? 0 : 3;
}
