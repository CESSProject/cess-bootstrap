# Become consensus node

After you start the consensus node server, you can perform the following steps to become a consensus.

## Generate session key

- Execute the following command on the node server

```shell
curl -H "Content-Type: application/json" -d '{"id":1, "jsonrpc":"2.0", "method": "author_rotateKeys", "params":[]}' http://localhost:9933
```

Save the "result" field of the returned result, which will be used in subsequent operations.

## Set session key

Block Browser Network -> Staking -> Account Actions -> Session key

![Image text](https://github.com/CESSProject/W3F-illustration/blob/b08c27a406f3c293877c8be8956d2768723e370d/cess-boostrap/3.jpg)

![Image text](https://github.com/CESSProject/W3F-illustration/blob/b08c27a406f3c293877c8be8956d2768723e370d/cess-boostrap/4.jpg)

- Fill in the session key generated earlier

## become a validator

Block Browser Network -> Staking -> Account Actions -> Validate

![Image text](https://github.com/CESSProject/W3F-illustration/blob/b08c27a406f3c293877c8be8956d2768723e370d/cess-boostrap/5.jpg)

![Image text](https://github.com/CESSProject/W3F-illustration/blob/b08c27a406f3c293877c8be8956d2768723e370d/cess-boostrap/6.jpg)

- 100% of the commission fee indicates that you do not want to accept nominations
- No nominations accepted

Block Browser Network -> Staking -> Waiting

![Image text](https://github.com/CESSProject/W3F-illustration/blob/b08c27a406f3c293877c8be8956d2768723e370d/cess-boostrap/7.jpg)

The node has appeared in the candidate node list.