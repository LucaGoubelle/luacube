require "solver_helpers.cube_algorithms"

local ca = CubeAlgorithms:new()

-- OLLs processor
OLLProcessor={}

function OLLProcessor:new()
    local obj = {
        data={
            -- antisunes cases
            FF_TFTF_FFFT_TF_ = ca.ANTISUNE_ORIENT,
            FT_FTFF_FFFT_TF_ = "U "..ca.ANTISUNE_ORIENT,
            FT_TFFF_FFTF_TF_ = "U' "..ca.ANTISUNE_ORIENT,
            FT_TFFF_FTFT_FF_ = "U2 "..ca.ANTISUNE_ORIENT,

            -- sunes cases
            TF_FFFT_FTFF_FT_ = ca.SUNE_ORIENT,
            TF_FFFT_TFTF_FF_ = "U "..ca.SUNE_ORIENT,
            FF_FTFT_TFFF_FT_ = "U' "..ca.SUNE_ORIENT,
            TF_FFTF_TFFF_FT_ = "U2 "..ca.SUNE_ORIENT,
        }
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function OLLProcessor:process(inputData)
    local result = self.data[inputData] or "???"
    return result
end
