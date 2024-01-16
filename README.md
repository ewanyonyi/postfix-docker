# Docker Image for Postfix Mail Server

How to build and Run the image:

    $ docker build -t my-postfix-image
    $ docker run -d --name postfix-container -p 25:25 -e DOMAIN_NAME=your-custom-domain.com postfix-image
