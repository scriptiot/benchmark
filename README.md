### 1. EVM 测试仓库

`evm-benchmark`仓库是EVM对javascript语法和性能测试的对外仓库，旨在完善EVM对javascript语言的语法支持和性能优化


### 2. 目录结构

| 文件      |    说明|
| :-------- | --------:|
| **evm**| evm测试工程目录 |
| **evm/bin**| windows和Linux的ejs二进制版本 |
| **evm/lib**| windows和Linux的libejs.a 静态库 |
| **evm/src**| ejs源码工程目录 |
| **quickjs**|   quickjs源码工程目录 |
| **quickjs/bin**|   windows和Linux的quickjs二进制版本 |
| **quickjs/src**|   quickjs源码工程目录 |  
| **test**|    测试脚本目录|
| **test/benchmark**|    测试脚本目录|
| **test/basic**|    基础语法测试脚本集|
| **test/operater**|    运算符测试脚本集|
| **test/statement**|    语句测试脚本集|
| **test/object**|    对象测试脚本集|
| **test/function**|    函数测试脚本集|
| **readme.md**|    仓库说明 | 


### 3. 测试报告

[EVM vs QuickJs测试报告](https://www.yuque.com/docs/share/c134542d-19e5-4cd1-bf8f-c95f5e3c74dc)


### 4. 构建EVM

```
cd evm/src/x86
make
```

### 5. 构建quickjs

```
cd quickjs/src/x86
make
```

### 6. EVM问卷调查


**欢迎大家投票，选出你最喜欢的物联网开发语言， EVM团队会优先支持!**

[EVM支持多语言开发物联网，你最希望支持的语言是哪一种语言?](https://www.wenjuan.com/s/Qre6Vf/)
