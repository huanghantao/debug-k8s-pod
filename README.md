# debug-k8s-pod

当我们开发例如`Operator`，`Aggregated API`等服务的时候，调试一直是个麻烦事情。好在我们通过`cloud code`能解决这个问题。大概看了下，它是把请求从宿主机转发到了`pod`实现的。

## 步骤

构建镜像：

```bash
docker build -t codinghuang/debug-k8s-pod:v0.0.2 .
```

部署`deployment`：

```yaml
kubectl apply -f deployment.yml
```

下载谷歌的`cloud code`插件，然后`attach`到`pod`即可调试。
