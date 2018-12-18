local M = {
        framework_dir = "framework_dir"
}



function M.init()
        package.path = "/root/or/work/openresty-router/?.lua;" .. package.path
        package.cpath = "/root/or/work/openresty-router/?.so;;" .. package.cpath
        package.path = ngx.var.lua_path .. "?.lua;" .. package.path
        package.cpath = ngx.var.lua_cpath .. "?.so;;" .. package.cpath
end

function M.print(content)
        ngx.say(content)
end


function M:run( url )
        print(package.path)
        print(package.cpath)

        local app = require("framework_dir/app")

        self.name = "abcdefg"

        app:set('index', self)

        local response = nil

end

function M.print( content )
        ngx.say(content)
end


function M:run( url )
        print(package.path)
        print(package.cpath)

        local app = require("framework_dir/app")

        self.name = "abcdefg"

        app:set('index', self)

        local response = nil

        local status, entity = pcall(reuire, url)

        if not status then
                self:print("seript missing")
                do return end
        end

        if type(entity.run) == "function" then
                response = entity.run()
        end

        self:print(response)

end
M:init()
M:run()



return M
