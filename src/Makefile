# 默认目标
all: real_make

# 定义变量指向上级目录的Makefile
UPPER_MAKEFILE := ../Makefile

# 调用上级目录的Makefile
real_make:
	$(MAKE) -C .. $(MAKECMDGOALS)

# 捕获所有目标和模式规则
%::
	$(MAKE) -C .. $@

# 清除目标
clean:
	$(MAKE) -C .. clean
