list1 = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '!', '#', '$', '%', '&', '(', ')', '*', ',', '-', '.', '/', ':', ';', '<', '>', '?', '@', '^', '_', '`', '{', '|', '}', '~', '¡', '¢', '£', '¤', '¥', '¦', '§', '¨', 'ª'}

num = arg[1]

local function TruncateList()
    if num ~= 'None' then
        for k=0,(#list1-num-1) do
            list1[#list1] = nil
        end
    end
end

if pcall(function() TruncateList() end) == false then 
    error("VAL must be a integer or None!")
end

local function GetListItem(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return error("An item wasn't in list")
end

local function PopItems(l)
    for _,x in pairs(l) do
        table.remove(list1, GetListItem(list1, x))
    end
end

local function ShuffleInPlace(t)
    math.randomseed(os.time())
    for i = #t, 2, -1 do
        local j = math.random(i)
        t[i], t[j] = t[j], t[i]
    end
end

bsaver = {}

local function Teir(...)
    result = ""
    t = {...}
    --print(table.concat(t))
    ts = {}
    for h,_ in pairs(t) do
	print(h)
    	ts[h] = t[#t-h+1]
	print(table.concat(ts))
    end
    --print(table.concat(t))
    for _,n in pairs(ts) do
        ts = {}
        b = string.gsub(n, "%s+", "")
        b:gsub(".",function(c) table.insert(ts,c) end)
        PopItems(ts)
        ShuffleInPlace(ts)
        table.insert(bsaver, ts)
    end
    --print(bsaver[3])
    ShuffleInPlace(list1)
    result = result .. table.concat(list1)
    for _,c in pairs(bsaver) do
        result = result .. table.concat(c)
    end
    return result
end

table.remove(arg, 1)

items = arg
--print(table.unpack(items))
RESULT = Teir(table.unpack(items))
print(RESULT)

os.exit()
