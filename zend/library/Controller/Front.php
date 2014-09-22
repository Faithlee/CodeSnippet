<?php
/**
 * @FileName: Front.php
 * @Desc: 单件模式
 * @Author: Faithlee098
 * @Mail: lijiabin098@126.com 
 * @CTime: Mon 22 Sep 2014 10:34:09 PM CST
 */

class Front {
	protected $_baseUrl = null;

	protected $_controllerDir = null;

	protected $_dispatcher = null;

	protected static $_instance = null;

	protected $_invokeParams = array();

	protected $_plugins = null;

	protected $_request = null;

	protected $_response = null;

	protected $_router = null;

	protected $_throwExceptions = false;


	protected function __contruct()
	{
		$this->_plugins = '';
	}

	private function __clone()	
	{
	
	}
		
	/**
	 * getInstance 单件模式
	 * 
	 * @static
	 * @access public
	 * @return void
	 */
	public static function getInstance()
	{
		if (null === self::$_instance) {
			self::$_instance = new self();
		}
		
		return self::$_instance;	
	}
	
	public function resetInstance()	
	{
		$reflection = new ReflectionObject($this);
		//返回反射属性对象
		$property = $reflection->getProperties();
		
		foreach ($property as $pro) {
			//返回属性名称，即对象的成员属性名称
			$name = $pro->getName();

			switch ($name) {
				case '_instance' :
					break;
				case '_controllerDir':
				case '_invokeParams':
					$this->{$name} = array();
					break;
				case '_plugins':
					$this->{$name} = '';
					break;
				case '_throwException':
					$this->{$name} = null;
					break;
				default:
					$this->{$name} = null;
					break;
			}
		}
		
		//print_r($property);
		Zend_Controller_Action_HelperBroker::resetHelpers();
	}

	/*{{{public function getDispatcher()*/
	/**
	 * getDispatcher 获取标准分发器
	 * 
	 * @access public
	 * @return void
	 */
	public function getDispatcher()
	{
		if (!$this->_dispatcher instanceof Zend_Controller_Dispatcher_Interface) {
			require 'Dispatcher/Standard.php';
			$this->_dispatcher = new Zend_Controller_Dispatcher_Standard();
		}

		return $this->_dispatcher;
	}
	/*}}}*/
	/*{{{public static function run()*/
	public static function run()
	{
	
	}
	/*}}}*/
	/*{{{public function addControllerDirectory()*/

	public function addControllerDirectory($directory, $module = null)
	{
		//todo 	
	}
	
	/*}}}*/
	/*{{{public function setControllerDirectory()*/

	//todo 
	public function setControllerDirectory($directory, $module = null)
	{
		
	}

	/*}}}*/
	/*{{{public function getControllerDirectory()*/

	//todo
	public function getControllerDirectory($name = null)
	{
			
	}

	/*}}}*/
	/*{{{public function removeControllerDirectory()*/

	//todo 
	public function removeControllerDirectory()
	{
	
	}

	/*}}}*/
	/*{{{public function addModuleDirectory()*/
	
	public function addModuleDirectory($path)
	{
		try {
			$dir = new DirectoryIterator($path);	
		} catch (Exception $e) {
			require_once 'Zend/Controller/Exception.php';
		}


		
	}

	/*}}}*/


}

$front = Front::getInstance();
$front->resetInstance();