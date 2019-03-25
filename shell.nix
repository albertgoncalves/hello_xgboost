{ pkgs ? import <nixpkgs> {} }:
with pkgs; mkShell {
    name = "XGBoost";
    buildInputs = [
        gcc8
        llvmPackages.openmp
        llvmPackages.libcxxClang
    ];
    shellHook = ''
        if [ ! -d xgboost/ ]; then
            git clone --recursive https://github.com/dmlc/xgboost
            cd xgboost/
            make -j4
            cd ../
        fi
        if [ $(uname -s) = "Darwin" ]; then
            alias ls='ls --color=auto'
            alias ll='ls -al'
        fi
    '';
}
