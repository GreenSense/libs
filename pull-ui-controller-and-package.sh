DIR=$PWD

cd ..

PROJECT_PATH="Serial1602ShieldSystemUIController"

if [ ! -d $PROJECT_PATH ]; then
    git clone https://github.com/GreenSense/Serial1602ShieldSystemUIController.git || exit 1
fi

cd $PROJECT_PATH && \

sh clean.sh && \

git checkout dev && \

git pull origin dev && \

sh init.sh && \

sh increment-version.sh && \

sh inject-version.sh && \

sh push-version.sh && \

sh build.sh && \

sh graduate.sh && \

git checkout master && \

sh nuget-pack.sh && \
#-sh pull-test-graduate-pack.sh && \

cp pkg/*.nupkg ../libs/ -f && \

cd $DIR && \

echo "Done"