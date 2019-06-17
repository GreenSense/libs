echo "Adding and pushing new packages..."

sh add-packages.sh && \
git commit -am "Added packages" && \
git pull origin master && \
git push origin master && \

echo "Finished pushing new packages"