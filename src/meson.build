subdir('Snack')

libsnack_sources = [
  snack_sources,
  config_file
]

libsnack = library(
  LIBRARY_NAME + '-' + API_VERSION,
  libsnack_sources,
  vala_header: LIBRARY_NAME + '.h',
  vala_vapi: LIBRARY_NAME + '-' + API_VERSION + '.vapi',
  vala_gir: GIR_NAME + '-' + API_VERSION + '.gir',
  soversion: API_VERSION,
  dependencies : libsnack_deps,
  vala_args: [
    '--abi-stability'
    ],
  install: true,
  install_dir: [
    true,
    get_option('includedir') / LIBRARY_NAME + '-' + API_VERSION / LIBRARY_NAME,
    vapidir,
    g_ir_compiler.found()
  ]
)

libsnack_dep = declare_dependency(
  link_with: libsnack,
  include_directories: '.',
  dependencies: libsnack_deps
)

if g_ir_compiler.found()
  custom_target(
    LIBRARY_NAME + '-typelib',
    command: [
      g_ir_compiler,
      '--shared-library', LIBRARY_NAME + '-@0@.so'.format (API_VERSION),
      '--output', '@OUTPUT@',
      meson.current_build_dir() / GIR_NAME + '-' + API_VERSION + '.gir'
    ],
    output: GIR_NAME + '-' + API_VERSION + '.typelib',
    depends: libsnack,
    install: true,
    install_dir: join_paths(get_option('libdir'), 'girepository-1.0')
  )
endif

pkgconfig.generate(
  libsnack,
  version: API_VERSION,
  name: LIBRARY_NAME,
  filebase: LIBRARY_NAME + '-' + API_VERSION,
  subdirs: LIBRARY_NAME + '-' + API_VERSION,
  requires: PKGCONFIG_DEPS,
  description: PROJECT_DESCRIPTION
)
