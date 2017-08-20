php = {}

function php.eval(str)
    return _php_eval(str)
end

function php.call(name, args)
    return _php_call(name, args)
end

php.get = _php_get
php.post = _php_post
php.session = _php_session
php.cookie = _php_cookie
php.request = _php_request
php.server = _php_server