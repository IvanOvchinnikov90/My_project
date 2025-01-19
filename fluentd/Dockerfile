FROM fluent/fluentd:v1.17.1-debian-1.0
USER root
RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-document"]
RUN ["gem", "install", "fluent-plugin-record-modifier", "--no-document"]
RUN ["gem", "install", "fluent-plugin-rewrite-tag-filter", "--no-document"]
RUN ["gem", "install", "fluent-plugin-nginx-error-multiline", "--no-document"]
RUN mkdir -p /fluentd/nginx && \
    chown -R fluent:fluent /fluentd/nginx
USER fluent
