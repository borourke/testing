FROM ruby:2.3.3-alpine

RUN apk update && apk add --no-cache libstdc++ tzdata postgresql-client nodejs curl

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.4/main' >> /etc/apk/repositories && \
    apk update && apk add --no-cache --virtual build-dependencies build-base postgresql && \
    cp /usr/bin/pg_dump* /usr/local/bin/ && \
    chmod u+x /usr/local/bin/pg_dump*

WORKDIR /app
COPY Gemfile* ./
RUN apk add --no-cache --virtual build-dependencies alpine-sdk linux-headers build-base ruby-dev openssh-client postgresql postgresql-dev && \
    echo 'gem: --no-document' > /etc/gemrc && \
    gem install bundler --no-ri --no-rdoc && \
    bundle install --retry 3

# Install the AWS CLI for retrieving credentials from S3
RUN apk update && \
    apk add --virtual build-dependencies python-dev python curl unzip && cd /tmp && \
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip && rm -rf awscli-bundle

COPY . ./

EXPOSE 3000

ENTRYPOINT ["/app/entrypoint.sh"]