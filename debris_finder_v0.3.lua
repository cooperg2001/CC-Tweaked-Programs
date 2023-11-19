-- Program: Debris Finder Portable v0.3
-- Author: cooperg2001
-- Description: This program will show distance to ancient debris within a 16 block radius.

print("Debris Finder Portable v0.3")

geo = peripheral.wrap("back")

function northSouth(blkZ)
    if (blkZ > 0) then
        retStr = string.format("S%d", blkZ)
    elseif (blkZ < 0) then
        retStr = string.format("N%d", math.abs(blkZ))
    else retStr = "0"
    end       
    return retStr
end

function eastWest(blkX)
    if (blkX > 0) then
        retStr = string.format("E%d", blkX)
    elseif (blkX < 0) then
        retStr = string.format("W%d", math.abs(blkX))
    else retStr = "0"
    end
    return retStr        
end

function upDown(blkY)
    if (blkY > 0) then
        retStr = string.format("U%d", blkY)
    elseif (blkY < 0) then
        retStr = string.format("D%d", math.abs(blkY))
    else retStr = "0"
    end
    return retStr
end

function buildStr(x,z,y)   
    s = string.format("Found Debris: %s,%s,%s", northSouth(z),eastWest(x),upDown(y))
    print(s)
end

while (1) do
    term.clear()
    term.setCursorPos(1,1)
    print("Debris Finder Portable v0.3")
    print("Scan Range 16")
    local scan = geo.scan(16)

    for i, block_data in ipairs(scan) do
        if (block_data.name == "minecraft:ancient_debris") then
            buildStr(block_data.x,block_data.z,block_data.y)            
        end
    end
    sleep(2)
end
