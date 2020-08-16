/****************************************************************************
**
** Copyright (C) 2020 @scriptiot
**
**  EVM是一款通用化设计的虚拟机引擎，拥有语法解析前端接口、编译器、虚拟机和虚拟机扩展接口框架。
**  支持js、python、qml、lua等多种脚本语言，纯Ｃ开发，零依赖，内置REPL，支持主流 ROM > 40KB, RAM > 2KB的MCU;
**  自带垃圾回收（GC）先进的内存管理，采用最复杂的压缩算法，无内存碎片（大部分解释器都存在内存碎片）
**  Version	: 1.0
**  Email	: scriptiot@aliyun.com
**  Website	: https://github.com/scriptiot/evm
**            https://gitee.com/scriptiot/evm
**  Licence: Apache-2.0
****************************************************************************/

#ifndef EVMBENCH_H
#define EVMBENCH_H

#include "evm.h"
#include <time.h>

clock_t eclock(){
#ifdef EVM_ENABLE_TIME_DEBUG
    return clock();
#endif    
}

double clock_func(clock_t start_t, clock_t end_t){
#ifdef EVM_ENABLE_TIME_DEBUG
    double total_t;
    total_t = (double)(end_t - start_t) / CLOCKS_PER_SEC;
    return total_t;
#endif 
}

evm_val_t sum(evm_t * e, evm_val_t * p, int argc, evm_val_t * v){
    (void)e;
    (void)p;
    (void)argc;
    (void)v;

    int start = evm_2_integer(v);
    int end = evm_2_integer(v+1);
    clock_t start_t = eclock();

    int ret=0;
    for(int i=start; i<=end; i++){
        ret += i;
    }

    clock_t end_t = eclock();
    double t =  clock_func(start_t, end_t);

    return evm_mk_number(t);;
}

int evmbench_module(evm_t * e){
    evm_builtin_t natives[] = {
        {"sum", evm_mk_native( (intptr_t)sum )},
        {NULL, EVM_VAL_UNDEFINED}
    };
    return evm_native_add(e, natives);
}

#endif
