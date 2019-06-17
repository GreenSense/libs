DIR=$PWD

cd ..

DUINOCOM_CORE_PATH="duinocom.core"

if [ ! -d $DUINOCOM_CORE_PATH ]; then
    git clone https://github.com/CompulsiveCoder/duinocom.core.git || exit 1
fi

cd $DUINOCOM_CORE_PATH && \

sh pull-test-graduate-pack.sh && \

cp pkg/*.nupkg ../libs/ -f && \

cd $DIR

