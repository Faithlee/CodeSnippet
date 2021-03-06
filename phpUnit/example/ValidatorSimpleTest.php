<?php
/**
 * @FileName: ValidatorSimpleTest.php
 * @Desc: 测试user方法
 * @Author: lijiawei
 * @Mail: li.jiawei@leftbrain.com.cn
 * @CTime: Tue 28 Oct 2014 04:42:54 PM CST
 */

require_once 'UserStore.php';
require_once 'Validator.php';

$store = new UserStore();
$store->addUser('admin', 'admin@sina.com', '123456');

$validator = new Validator($store);

if ($validator->validateUser('admin@sina.com', '123456')) {
	echo 'Pass, Welcome!';
} else {
	echo 'You are refused!';
}
