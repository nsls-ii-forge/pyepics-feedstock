NOLIBCA=1 ${PYTHON} -m pip install . --no-deps -vv

mkdir -p $PREFIX/etc/conda/activate.d
cat <<EOF > $PREFIX/etc/conda/activate.d/pyepics_activate.sh
export PYEPICS_LIBCA="\${EPICS_BASE}/lib/\${EPICS_HOST_ARCH}/libca${SHLIB_EXT}"
EOF

mkdir -p $PREFIX/etc/conda/deactivate.d
cat <<EOF > $PREFIX/etc/conda/deactivate.d/pyepics_deactivate.sh
unset PYEPICS_LIBCA
EOF
