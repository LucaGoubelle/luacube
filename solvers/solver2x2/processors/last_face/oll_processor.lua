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

            -- U cases
            FF_TFTF_TFTF_FF_ = "F R U R' U' F'",
            FF_FTTF_FFFF_TT_ = "U F R U R' U' F'",
            TT_FFFF_FTTF_FF_ = "U' F R U R' U' F'",
            FF_FTFT_FTFT_FF_ = "U2 F R U R' U' F'",

            -- T cases
            TF_FFTF_FFTF_TF_ = "R U R' U' R' F R F'",
            FF_FTTF_TFFT_FF_ = "U R U R' U' R' F R F'",
            FF_TFFT_FTTF_FF_ = "U' R U R' U' R' F R F'",
            FT_FTFF_FTFF_FT_ = "U2 R U R' U' R' F R F'",

            -- L cases
            FF_FTFT_FFTF_TF_ = "F R' F' R U R U' R'",
            FT_FTFF_TFTF_FF_ = "U2 F R' F' R U R U' R'",
            TF_FFTF_FTFT_FF_ = "U F R' F' R U R U' R'",
            FF_TFTF_FTFF_FT_ = "U' F R' F' R U R U' R'",

            -- Pi cases
            FT_TFFF_TFFF_FT_ = ca.PI_ORIENT,
            FF_TFFT_FFFF_TT_ = "U "..ca.PI_ORIENT,
            TF_FFFT_FFFT_TF_ = "U2 "..ca.PI_ORIENT,
            TT_FFFF_TFFT_FF_ = "U' "..ca.PI_ORIENT
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
