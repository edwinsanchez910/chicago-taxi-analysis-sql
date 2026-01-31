#!/bin/bash

# ==========================================================
# PROYECTO: INVESTIGACIÓN DE LOGS EN SERVIDOR REMOTO
# OBJETIVO: Depuración de errores y organización de eventos
# ==========================================================

# 1. BUSCAR SOLICITUDES POR IP ESPECÍFICA
# Filtramos las IPs que inician con '233.201' en los logs de diciembre.
grep -h "^233.201" logs/2019/12/*

# 2. ORGANIZACIÓN DE ERRORES (BUG 1)
# Creamos estructura para separar errores críticos de servidor (500) y de cliente (400).
mkdir -p bug1/events

# 3. FILTRADO POR FECHA Y CÓDIGO HTTP
# Extraemos logs del 30 de diciembre al archivo principal y luego segmentamos.
grep "30/12/2019" logs/2019/12/* > bug1/main.txt
grep " 400 " bug1/main.txt > bug1/events/400.txt
grep " 500 " bug1/main.txt > bug1/events/500.txt

echo "Proceso de filtrado completado con éxito."
