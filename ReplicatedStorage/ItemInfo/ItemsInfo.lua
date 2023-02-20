local module = {}

--  {["Type"] = "Item", ["Stackable"] = true, ["Weight"] = 2}

module.Log = {["Type"] = "Item", ["Stackable"] = true, ["Weight"] = 3}
module.Wood = {["Type"] = "Item", ["Stackable"] = true, ["Weight"] = 3}
module.Stone = {["Type"] = "Item", ["Stackable"] = true, ["Weight"] = 3}
module.Leaves = {["Type"] = "Item", ["Stackable"] = true, ["Weight"] = 2}
module["Wood Pickaxe"] = {["Type"] = "Tool", ["Stackable"] = false, ["Weight"] = 5}
module["Wood Axe"] = {["Type"] = "Tool", ["Stackable"] = false, ["Weight"] = 5}
module["Raw Fish"] = {["Type"] = "Food", ["Stackable"] = true, ["Weight"] = 3, ["Health"] = -5, ["Hunger"] = 5}
module["Cooked Fish"] = {["Type"] = "Food", ["Stackable"] = true, ["Weight"] = 3, ["Health"] = 5, ["Hunger"] = 10}

return module
