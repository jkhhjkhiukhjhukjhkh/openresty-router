local M = {
}

M.instance = nil
M.instances = {}

function M:new(i)
        i = i or {}

        setmetable(i, self)

        self.__index = self

        return i
end

function M:instance()
        if self.instance == nil then
                self.instance = self:new()
        end

        return self.instance
end

function M:set( key, value )
        if not value then
                error("value is not correct", 0)
        end
        if self.instances[key] then
                return false
        end

        self.instances[key] = value
        return true
end

function M:get(key)
        if not self.instances[key] then
                return false
        end

        return self.instances[key]
end

return M
