<?php
    
    $url = $_SERVER['REQUEST_URI'];
    $url = explode("?", $url)[0];
    $basedir = dirname($_SERVER['SCRIPT_NAME']);
    $url = str_replace($basedir, "", $url);
    
    @session_start();
    
    $lua = new Lua();
    
    function _php_eval($str){
        return eval($str);
    }
    $lua->registerCallback("_php_eval","_php_eval");
    
    function _php_call($name, $args){
        $a = "";
        foreach($args as $k=>$v){
            $a .= ", \$GLOBALS['lua_tmp_arg'][$k]";
        }
        $GLOBALS['lua_tmp_arg'] = $args;
        //echo $a;
        return eval("return call_user_func('$name' $a);");
    }
    $lua->registerCallback("_php_call","_php_call");
    
    $lua->registerCallback("include", function ($name) use ($lua){
        return $lua->include(__DIR__.'/'.$name.'.lua');
    });
    
    $lua->assign("_php_get", $_GET);
    $lua->assign("_php_post", $_POST);
    $lua->assign("_php_request", $_REQUEST);
    $lua->assign("_php_cookie", $_COOKIE);
    $lua->assign("_php_session", $_SESSION);
    $lua->assign("_php_server", $_SERVER);
    
    if(is_dir(__DIR__.$url)){
        $url .= "/index.lua";
    }
    
    if(!is_file(__DIR__.$url)){
        header("HTTP/1.1 404 Not Found");
        header("Status: 404");
        die("
            <h1 align=center>Error 404</h1>
            <p align=center>Not Found</p>
            <hr />
            <p align=center><i>Server: PHP+Lua</i></p>
        ");
    }
    
    try{
        $lua->include(__DIR__.'/lib/php.lua');
        $lua->include(__DIR__.$url);
    }catch(LuaException $e){
        die("<b>Lua Error: </b>". $e->getMessage() . " <b>on line " . $e->getLine() . "</b>.");
    }
    