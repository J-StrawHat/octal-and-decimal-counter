# octal-and-decimal-counter
基于FPGA实现的可控进制的计数器（8进制或15进制）

## 引言

本仓库存放的是我们数字电路实验的第四次课程设计，设计一个可控进制的计数器。

由于源项目超过100MB，无法上传至GitHub，故仓库仅存放了最核心的三个文件：`FinalCounter.v` （源代码）、`FinalCounter_sim.v`（仿真代码）、`FinalCounter_cons.xdc`（约束文件）。

## 实验环境

+ 开发板型号：[Nexys 4 DDR](https://reference.digilentinc.com/programmable-logic/nexys-4-ddr/start?redirect=1)

+ 芯片型号：`xc7a100tcsg324-1`

+ 集成设计环境：[Vivado 2019.1](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive.html)
    
    > 软件参考教程：[Vivado如何获取License](https://blog.csdn.net/pengwangguo/article/details/75502866)

## 实验内容

1. 设计可控进制的计数器：在输入控制变量的作用下实现计数器。在输入 0 时工作在 `8` 进制；在输入 1 时工作在 `15` 进制。

2. 用数码管显示输出结果。

## 实验原理

### 输入变量

+ 一位二进制 opt ，代表进制选择：opt=0，则工作 8 进制；opt=1，则工作在 15 进制；
+ 一位二进制 clk ，代表时钟信号，为更好地演示效果，将时钟信号映射到开发板的按钮 `P17`；
+ 一位二进制 rst ，用于异步清零；

### 输出变量

+ 八位二进制 `dis` ，代表电路当前的计数状态

### 功能分析

+ 当 opt=0 时，电路工作在 8 进制，每当接收到上升沿的时钟信号，电路计数状态 cnt 就会加一，同时，数码管会显示当前计数状态对应的数字。直到计满 8 个状态即 cnt=`0111` 时，电路在下一个上升沿的时钟信号下，就会自动地清零。

+ 当 opt=1 时，电路工作在 15 进制，每当接收到上升沿的时钟信号，电路计数状态 cnt 就会加一，同时，数码管会显示当前计数状态对应的数字。直到计满 15 个状态即 cnt=`1110` 时，电路在下一个上升沿的时钟信号下，就会自动地清零。



