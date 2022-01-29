
require([[_build._buildactions]])
--- @diagnostic disable: undefined-global

require("LifeBoatAPI.Tools.Build.Builder")

local luaDocsAddonPath  = LifeBoatAPI.Tools.Filepath:new(arg[1]);
local luaDocsMCPath     = LifeBoatAPI.Tools.Filepath:new(arg[2]);
local outputDir         = LifeBoatAPI.Tools.Filepath:new(arg[3]);
local params            = {
    boilerPlate             = arg[4],
    reduceAllWhitespace     = arg[5] == "true",
    reduceNewlines          = arg[6] == "true",
    removeRedundancies      = arg[7] == "true",
    shortenVariables        = arg[8] == "true",
    shortenGlobals          = arg[9] == "true",
    shortenNumbers          = arg[10]== "true",
    forceNCBoilerplate      = arg[11]== "true",
    forceBoilerplate        = arg[12]== "true",
    shortenStringDuplicates = arg[13]== "true",
    removeComments          = arg[14]== "true",
    skipCombinedFileOutput  = arg[15]== "true"
};
local rootDirs          = {};

for i=15, #arg do
    table.insert(rootDirs, LifeBoatAPI.Tools.Filepath:new(arg[i]));
end

local _builder = LifeBoatAPI.Tools.Builder:new(rootDirs, outputDir, luaDocsMCPath, luaDocsAddonPath)

if onLBBuildStarted then onLBBuildStarted(_builder, params, LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat]])) end

if onLBBuildFileStarted then onLBBuildFileStarted(_builder, params, LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat]]), [[STDebugger.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\STDebugger.lua]])) end

local combinedText, outText, outFile = _builder:buildMicrocontroller([[STDebugger.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\STDebugger.lua]]), params)
if onLBBuildFileComplete then onLBBuildFileComplete(LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat]]), [[STDebugger.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\STDebugger.lua]]), outFile, combinedText, outText) end

if onLBBuildFileStarted then onLBBuildFileStarted(_builder, params, LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat]]), [[serverManager.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\serverManager.lua]])) end

local combinedText, outText, outFile = _builder:buildMicrocontroller([[serverManager.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\serverManager.lua]]), params)
if onLBBuildFileComplete then onLBBuildFileComplete(LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat]]), [[serverManager.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\serverManager.lua]]), outFile, combinedText, outText) end

if onLBBuildFileStarted then onLBBuildFileStarted(_builder, params, LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat]]), [[selfFreq.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\selfFreq.lua]])) end

local combinedText, outText, outFile = _builder:buildMicrocontroller([[selfFreq.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\selfFreq.lua]]), params)
if onLBBuildFileComplete then onLBBuildFileComplete(LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat]]), [[selfFreq.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\selfFreq.lua]]), outFile, combinedText, outText) end

if onLBBuildFileStarted then onLBBuildFileStarted(_builder, params, LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat]]), [[colorPicker.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\colorPicker.lua]])) end

local combinedText, outText, outFile = _builder:buildMicrocontroller([[colorPicker.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\colorPicker.lua]]), params)
if onLBBuildFileComplete then onLBBuildFileComplete(LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat]]), [[colorPicker.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\colorPicker.lua]]), outFile, combinedText, outText) end

if onLBBuildFileStarted then onLBBuildFileStarted(_builder, params, LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat]]), [[chatManager.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\chatManager.lua]])) end

local combinedText, outText, outFile = _builder:buildMicrocontroller([[chatManager.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\chatManager.lua]]), params)
if onLBBuildFileComplete then onLBBuildFileComplete(LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat]]), [[chatManager.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\chatManager.lua]]), outFile, combinedText, outText) end

if onLBBuildFileStarted then onLBBuildFileStarted(_builder, params, LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat]]), [[memory.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\memory.lua]])) end

local combinedText, outText, outFile = _builder:buildMicrocontroller([[memory.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\memory.lua]]), params)
if onLBBuildFileComplete then onLBBuildFileComplete(LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat]]), [[memory.lua]], LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat\memory.lua]]), outFile, combinedText, outText) end

if onLBBuildComplete then onLBBuildComplete(_builder, params, LifeBoatAPI.Tools.Filepath:new([[d:\ggg\Stormworks\SenChat]])) end
--- @diagnostic enable: undefined-global
