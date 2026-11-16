# Restricciones propias del core (las generales estan en sys/sys_top.sdc).
# No se usa la SDRAM: toda la memoria del TS2068 esta en BRAM.

# ----------------------------------------------------------------------------
# T80: todos sus registros internos se actualizan solo con CEN_p / CEN_n
# (pe3M5 / ne3M5, 1 de cada 16 ciclos y separados 8 ciclos entre si), asi que
# las rutas internas del T80 tienen al menos 2 ciclos. Solo se relajan las
# rutas de T80 a T80; las entradas y salidas del procesador quedan a 1 ciclo.
# ----------------------------------------------------------------------------
set t80 [get_keepers {emu|ts|cpu|Cpu|*}]
set_multicycle_path -from $t80 -to $t80 -setup 2
set_multicycle_path -from $t80 -to $t80 -hold 1
