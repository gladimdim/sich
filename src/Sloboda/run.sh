 docker run --name my_pharo -d -p 5901:5901 -p 6901:6901 -p 9090:9090 \
    -v=$HOME/projects/sich/Pharo/images/Pharo:/root/data \
    -v=$HOME/projects/sich:/root/gitrepo \
    pharo