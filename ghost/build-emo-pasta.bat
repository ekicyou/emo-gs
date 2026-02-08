setlocal
pushd %~dp0
  call env.bat
  robocopy /mir %PASTA_SCRIPT_DIR% %GHOST_SCRIPT_DIR%
  pushd %PASTA_REPOS_DIR%
    cargo build --release --target i686-pc-windows-msvc -p pasta_shiori --quiet
   popd

