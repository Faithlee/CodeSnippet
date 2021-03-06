<?php
/**
 * @FileName: UserStorePHPUnitTest.php
 * @Desc: 用户储存单元测试，目的就是让大家认识到单元测试是如何动作的!
 * @Author: Faithlee098
 * @Mail: lijiabin098@126.com 
 * @CTime: Mon 27 Oct 2014 10:48:48 PM CST
 */

require_once 'UserStore.php';

class UserStorePHPUnitTest extends PHPUnit_Framework_TestCase {
	private $store;

	/**
	 * @todo setUp功能?何为基境共享?
	 * 每个测试都会调用一次setUp模板
	 */
	public function setUp()	
	{
		$this->store = new UserStore();
	}

	/**
	 * @todo tearDown功能
	 */
	public function tearDown()
	{
		//销毁资源	
	}

	public function testAddUser()
	{
		try {
			$this->store->addUser('admin', 'admin@sina.com', '12ab');
		} catch (Exception $e) {
			return ;	
		}

		$this->fail('短密码异常！');
	}

	public function testGetUser()
	{
		//模拟基境 ==> 测试环境

		//what is 断言?	
		$this->store->addUser('admin', 'admin@sina.com', '123456');
		
		$user = $this->store->getUser('admin@sina.com');

		//todo assertEquals()的用法，参数：expected, actual, 误差，断言失败的信息
		//如何理解断言结果?

		//开始断言，有一个失败则都失败
		$this->assertEquals($user['name'], 'admin', '如果我出现则用户名断言失败！');

		$this->assertEquals($user['mail'], 'admin@sina.com', '断言测试失败');

		$this->assertEquals($user['pass'], '1234567', '断言测试失败');
	}


	//todo 介绍一些基本的断言函数	
	//assertTrue/assertSame/fail()
	
}
