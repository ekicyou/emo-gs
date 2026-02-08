pushd %~dp0
    set GHOST_ROOT_DIR=%cd%
        pushd ..
            set REPOS_DIR=%cd%
            pushd ..
                set GIT_DEV_DIR=%cd%
                popd
            popd
        popd
    popd

set        GHOST_DIR=%GHOST_ROOT_DIR%\emo-pasta
set GHOST_MASTER_DIR=%GHOST_DIR%\ghost\master
set GHOST_SCRIPT_DIR=%GHOST_MASTER_DIR%\scripts
set    GHOST_DIC_DIR=%GHOST_MASTER_DIR%\dic
set  PASTA_REPOS_DIR=%GIT_DEV_DIR%\pasta
set    PASTA_LUA_DIR=%PASTA_REPOS_DIR%\crates\pasta_lua
set PASTA_SCRIPT_DIR=%PASTA_LUA_DIR%\scripts
set    PASTA_X86_DIR=%PASTA_REPOS_DIR%\target\i686-pc-windows-msvc\release
set        PASTA_DLL=%PASTA_X86_DIR%\pasta.dll