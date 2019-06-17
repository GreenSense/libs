DIR=$PWD

cd ..

PROJECT_PATH="GitDeployer"

if [ ! -d $PROJECT_PATH ]; then
    git clone https://github.com/CompulsiveCoder/GitDeployer.git || exit 1
fi

cd $PROJECT_PATH && \

#sh clean.sh && \

git checkout dev && \

git pull origin dev && \

sh init.sh && \

sh increment-version.sh && \

sh push-version.sh && \

#sh inject-version.sh && \

sh graduate.sh && \

git checkout master && \

sh build.sh && \

sh nuget-pack.sh && \

cp pkg/*.nupkg ../libs/ -f && \

cd $DIR && \

echo "Done"