# 🧹 Limpiador de Archivos Temporales y Papelera

> ¿Tu disco se llena sin razón aparente? Este script de Windows limpia en segundos los archivos temporales y la papelera que el sistema acumula con el uso diario.

---

## 📋 Descripción

Script interactivo para **Windows** (`.bat`) que permite limpiar de forma selectiva o total los directorios de archivos temporales y la papelera de reciclaje. Cuenta con menú visual, confirmación antes de actuar y solicitud automática de permisos de administrador.

---

## ✨ Características

- ✅ Menú interactivo con selección individual o limpieza total
- ✅ Solicita permisos de administrador automáticamente
- ✅ Pide confirmación antes de ejecutar cualquier limpieza
- ✅ Muestra el progreso de cada operación en pantalla
- ✅ Compatible con Windows 10 y Windows 11

---

## 🗂️ ¿Qué limpia?

### 1. TEMP y TMP — Archivos temporales del usuario

Mientras los programas se ejecutan, crean archivos temporales en estas carpetas: instaladores dejan restos, aplicaciones guardan datos provisionales y los navegadores acumulan caché.

**Beneficios de limpiarlos:**
- Libera espacio en disco
- Evita conflictos causados por archivos antiguos o corruptos
- Puede mejorar el arranque de algunas aplicaciones

> ⚠️ Es seguro limpiar estas carpetas regularmente. Los programas en ejecución pueden bloquear algunos archivos; el script los omite automáticamente.

---

### 2. Prefetch — Datos de arranque de programas

Windows guarda en esta carpeta mapas de carga para abrir los programas más rápido. **No se recomienda borrarlo de forma habitual**, ya que obliga al sistema a reaprender cómo lanzar cada aplicación de forma eficiente.

**¿Cuándo sí conviene limpiarlo?**
- Sospechas de archivos corruptos en el sistema
- Problemas raros o lentos en el arranque de programas
- Aplicaciones que tardan más de lo normal sin motivo aparente

> 💡 Después de borrarlo, los primeros arranques de cada programa serán algo más lentos hasta que Windows regenere los mapas de carga.

---

### 3. Papelera de Reciclaje

Los archivos que "eliminas" en Windows no desaparecen: se mueven a la papelera y siguen ocupando espacio en disco hasta que se vacía.

**Beneficios de vaciarla:**
- Recupera el espacio ocupado por archivos que ya no necesitas
- Reduce el trabajo del sistema al gestionar el almacenamiento

> ⚠️ Esta operación es **irreversible**. Asegúrate de que no necesitas recuperar ningún archivo antes de ejecutarla.

---

## 🚀 Uso

1. Descarga o clona este repositorio.
2. Haz clic derecho sobre el archivo `.bat` y selecciona **"Ejecutar como administrador"** (o el propio script lo solicitará automáticamente).
3. Selecciona las opciones que deseas limpiar desde el menú interactivo.
4. Confirma la operación cuando se te solicite.

```
================================
     LIMPIEZA DEL SISTEMA
================================

  [1] Carpeta TEMP del usuario
  [2] Carpeta TMP
  [3] Carpeta Prefetch de Windows
  [4] Papelera de Reciclaje

  [A] Limpiar TODO (todas las opciones)
  [0] Salir del script
================================
```

---

## ⚙️ Requisitos

- Sistema operativo: **Windows 10 / Windows 11**
- Permisos de **administrador** (el script los solicita automáticamente)

---

## ⚠️ Advertencias

- La limpieza de la **Papelera de Reciclaje** es permanente e irreversible.
- Limpiar **Prefetch** con frecuencia puede ralentizar el arranque de tus programas temporalmente.
- El script omite los archivos que estén en uso por otras aplicaciones; esto es normal y no indica ningún error.

---

## 📄 Licencia

Este proyecto se distribuye bajo la licencia [MIT](LICENSE). Puedes usarlo, modificarlo y distribuirlo libremente.
