
# 运行阶段指定scratch作为基础镜像
FROM scratch

WORKDIR /app

# 将上一个阶段publish文件夹下的所有文件复制进来
COPY . /app

# # 为了防止代码中请求https链接报错，我们需要将证书纳入到scratch中
# COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/cert


EXPOSE 80

ENTRYPOINT ["./main"]