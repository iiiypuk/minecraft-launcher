set_project("assets-parser")
set_languages("c99")
add_rules("mode.debug", "mode.release")

toolchain("tcc")
    set_kind("standalone")
    set_toolset("cc", "tcc")
    set_toolset("ld", "tcc")
toolchain_end()

if is_mode("debug") then
    set_symbols("debug")
    set_optimize("none")
end

set_toolchains("tcc")

add_requires("cjson 1.7.15")

target("assets-parser")
    set_kind("binary")
    add_files("src/*.c")
    add_packages("cjson")

    after_build(function (target)
        -- os.exec("base64 -w 0 build/linux/x86_64/release/assets-parser > assets-x86_64-linux.data")
        os.exec("./compile.sh")
    end)
