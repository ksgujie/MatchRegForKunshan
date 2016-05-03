<?php

require_once 'HTTP/Client.php';

class myHttpClient extends HTTP_Client {
	var $autoReferer = true;
	
	function get($url)
	{
		$url=trim($url);
		return parent::get($url);
	}
	function body()
	{
		$response = $this->currentResponse();
		return $response['body'];
	}
	
	function getResponse()
	{
		return $this->currentResponse();
	}

	function getHtml($url) {
		return $this->html($url);
	}

	function html($url) {
		$url=trim($url);
		if ($this->autoReferer && !isset($this->_defaultHeaders['Referer'])) {
			$this->setDefaultHeader('Referer', $url);
		}
		$this->get($url);
		return $this->body();
	}
	
	function clearCookie()
	{
		$this->getCookieManager()->reset();
	}
	
	function addCookie($cookie)
	{
		$this->getCookieManager()->addCookie($cookie);
	}

	function addCookies($cookies)
	{
		foreach ((array)$cookies as $cookie) {
			$this->addCookie($cookie);
		}
	}
	
	function getCookies()
	{
		return $this->getCookieManager()->_cookies;
	}

	function setProxy($host,$port,$user=null,$pwd=null) 
	{
		if (strlen($host)) { $this->setRequestParameter('proxy_host',$host); }
		if (strlen($port)) { $this->setRequestParameter('proxy_port',$port); }
		if (!is_null($user)) { $this->setRequestParameter('proxy_user',$user); }
		if (!is_null($pwd)) { $this->setRequestParameter('proxy_password',$pwd); }
	}

    function cookieStringToArray($cookieString)
    {
        $cookie = array(
            'expires' => null,
            'domain'  => null,
            'path'    => null,
            'secure'  => false
        );

        // Only a name=value pair
        if (!strpos($cookieString, ';')) {
            $pos = strpos($cookieString, '=');
            $cookie['name']  = trim(substr($cookieString, 0, $pos));
            $cookie['value'] = trim(substr($cookieString, $pos + 1));

        // Some optional parameters are supplied
        } else {
            $elements = explode(';', $cookieString);
            $pos = strpos($elements[0], '=');
            $cookie['name']  = trim(substr($elements[0], 0, $pos));
            $cookie['value'] = trim(substr($elements[0], $pos + 1));

            for ($i = 1; $i < count($elements); $i++) {
                if (false === strpos($elements[$i], '=')) {
                    $elName  = trim($elements[$i]);
                    $elValue = null;
                } else {
                    list ($elName, $elValue) = array_map('trim', explode('=', $elements[$i]));
                }
                $elName = strtolower($elName);
                if ('secure' == $elName) {
                    $cookie['secure'] = true;
                } elseif ('expires' == $elName) {
                    $cookie['expires'] = str_replace('"', '', $elValue);
                } elseif ('path' == $elName || 'domain' == $elName) {
                    $cookie[$elName] = urldecode($elValue);
                } else {
                    $cookie[$elName] = $elValue;
                }
            }
        }
        return $cookie;
    }
}

?>