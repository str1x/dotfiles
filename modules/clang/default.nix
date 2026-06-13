{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # clang
    # llvmPackages.clangWithLibcAndBasicRtAndLibcxx
    llvmPackages.lldb
    llvmPackages.libllvm
    llvmPackages.libcxxStdenv
    llvmPackages.clang
    clang-tools
    cmake
    # libcxx
    ninja
  ];
}
