# $FreeBSD$

PORTNAME=	electron
DISTVERSIONPREFIX=	v
DISTVERSION=	${ELECTRON_VER:S/-beta./.b/}
CATEGORIES=	devel
MASTER_SITES=	LOCAL:chromium \
		https://commondatastorage.googleapis.com/chromium-nodejs/:chromium_node \
		https://commondatastorage.googleapis.com/chromium-fonts/:chromium_testfonts
DISTFILES=	chromium-${CHROMIUM_VER}${EXTRACT_SUFX}:chromium \
		${CHROMIUM_NODE_MODULES_HASH}:chromium_node

MAINTAINER=	maintainer@example.com
COMMENT=	Build cross-platform desktop apps with JavaScript, HTML, and CSS

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

FETCH_DEPENDS=	npm:www/npm-node10
PATCH_DEPENDS=	git:devel/git
BUILD_DEPENDS=	${LOCALBASE}/bin/ar:devel/binutils \
		gn:devel/chromium-gn \
		gperf:devel/gperf \
		yasm:devel/yasm \
		${LOCALBASE}/include/linux/videodev2.h:multimedia/v4l_compat \
		node:www/node10 \
		npm:www/npm-node10
LIB_DEPENDS=	libatk-bridge-2.0.so:accessibility/at-spi2-atk \
		libsnappy.so:archivers/snappy \
		libFLAC.so:audio/flac \
		libopus.so:audio/opus \
		libdbus-1.so:devel/dbus \
		libnotify.so:devel/libnotify \
		libpci.so:devel/libpci \
		libnspr4.so:devel/nspr \
		libre2.so:devel/re2 \
		libdrm.so:graphics/libdrm \
		libwebp.so:graphics/webp \
		libavcodec.so:multimedia/ffmpeg \
		libvpx.so:multimedia/libvpx \
		libopenh264.so:multimedia/openh264 \
		libfreetype.so:print/freetype2 \
		libharfbuzz.so:print/harfbuzz \
		libsecret-1.so:security/libsecret \
		libnss3.so:security/nss \
		libexpat.so:textproc/expat2 \
		libfontconfig.so:x11-fonts/fontconfig
RUN_DEPENDS=	xdg-open:devel/xdg-utils

USES=		bison dos2unix gettext-tools gl gnome jpeg localbase:ldflags \
		ninja pkgconfig python:2.7,build tar:xz

USE_GITHUB=	yes
GH_TAGNAME=	${DISTVERSIONPREFIX}${ELECTRON_VER}
# See ${WRKSRC}/electron/DEPS for GH_TAGNAME_node
GH_TUPLE=	electron:node:a86a4a160dc520c61a602c949a32a1bc4c0fc633:node
		# boto:boto:f7574aa6cc2c819430c1f05e9a1a1a666ef8169b:boto \
		# yaml:pyyaml:3.12:pyyaml \
		# kennethreitz:requests:e4d59bedfd3c7f4f254f4f5d036587bcd8152458:requests

ELECTRON_VER=	5.0.0
# See ${WRKSRC}/electron/DEPS for CHROMIUM_VER
CHROMIUM_VER=	73.0.3683.119
# See ${WRKSRC}/third_party/node/node_modules.tar.gz.sha1 for CHROMIUM_NODE_MODULES_HASH
CHROMIUM_NODE_MODULES_HASH=	c0e0f34498afb3f363cc37cd2e9c1a020cb020d9
# See ${WRKSRC}/third_party/test_fonts/test_fonts.tar.gz.sha1 for CHROMIUM_TEST_FONTS_HASH
CHROMIUM_TEST_FONTS_HASH=	a22de844e32a3f720d219e3911c3da3478039f89

NO_WRKSUBDIR=	yes
WRKSRC_SUBDIR=	src

DOS2UNIX_FILES=	third_party/skia/third_party/vulkanmemoryallocator/include/vk_mem_alloc.h
BINARY_ALIAS=	python=${PYTHON_CMD}

USE_XORG=	x11 xcb xcomposite xcursor xdamage xext xfixes xi xrandr \
		xrender xscrnsaver xtst
USE_GL=		gl glesv2
USE_GNOME=	atk cairo pango gdkpixbuf2 gtk30 libxml2 libxslt
USE_JAVA=	yes
JAVA_VERSION=	1.8
JAVA_BUILD=	yes

USE_LDCONFIG=	${DATADIR}

GN_ARGS+=	clang_use_chrome_plugins=false \
		enable_hangout_services_extension=true \
		enable_nacl=false \
		enable_remoting=false \
		fieldtrial_testing_like_official_build=true \
		is_clang=true \
		jumbo_file_merge_limit=8 \
		toolkit_views=true \
		treat_warnings_as_errors=false \
		use_allocator="none" \
		use_allocator_shim=false \
		use_aura=true \
		use_custom_libcxx=false \
		use_gnome_keyring=false \
		use_jumbo_build=true \
		use_lld=true \
		use_sysroot=false \
		use_system_freetype=true \
		use_system_harfbuzz=true \
		use_system_lcms2=true \
		use_system_libdrm=true \
		use_system_libjpeg=true \
		extra_cxxflags="${CXXFLAGS}" \
		extra_ldflags="${LDFLAGS}"

ALL_TARGET=	electron
MAKE_ARGS=	-C out/${BUILDTYPE}
MAKE_ENV+=	C_INCLUDE_PATH=${LOCALBASE}/include \
		CPLUS_INCLUDE_PATH=${LOCALBASE}/include

OPTIONS_DEFINE=	CUPS DEBUG DIST DRIVER KERBEROS TEST
DIST_DESC=	Build distribution zip files
DRIVER_DESC=	Install chromedriver
OPTIONS_GROUP=	AUDIO
OPTIONS_GROUP_AUDIO=	ALSA PULSEAUDIO
OPTIONS_DEFAULT=	CUPS DIST DRIVER KERBEROS ALSA
OPTIONS_SUB=	yes

ALSA_LIB_DEPENDS=	libasound.so:audio/alsa-lib
ALSA_RUN_DEPENDS=	${LOCALBASE}/lib/alsa-lib/libasound_module_pcm_oss.so:audio/alsa-plugins
ALSA_VARS=	GN_ARGS+=use_alsa=true
ALSA_VARS_OFF=	GN_ARGS+=use_alsa=false

CUPS_LIB_DEPENDS=	libcups.so:print/cups
CUPS_VARS=	GN_ARGS+=use_cups=true
CUPS_VARS_OFF=	GN_ARGS+=use_cups=false

DEBUG_VARS=	BUILDTYPE=Debug \
		GN_ARGS+=is_component_build=false
DEBUG_VARS_OFF=	BUILDTYPE=Release

DIST_ALL_TARGET=	dist.zip chromedriver.zip mksnapshot.zip
DIST_IMPLIES=		DRIVER

DRIVER_ALL_TARGET=	chromedriver

KERBEROS_VARS=	GN_ARGS+=use_kerberos=true
KERBEROS_VARS_OFF=	GN_ARGS+=use_kerberos=false

PULSEAUDIO_LIB_DEPENDS=	libpulse.so:audio/pulseaudio
PULSEAUDIO_VARS=	GN_ARGS+=use_pulseaudio=true
PULSEAUDIO_VARS_OFF=	GN_ARGS+=use_pulseaudio=false

.include "Makefile.tests"
TEST_DISTFILES=		${CHROMIUM_TEST_FONTS_HASH}:chromium_testfonts
TEST_ALL_TARGET=	${TEST_TARGETS}

post-fetch:
	${RM} -r ${TMPDIR}/npm-cache
	${MKDIR} ${TMPDIR}/npm-cache
	${CP} ${FILESDIR}/package.json ${FILESDIR}/package-lock.json ${TMPDIR}/npm-cache
	cd ${TMPDIR}/npm-cache && npm install --verbose --no-progress

post-extract:
	${MV} ${WRKDIR}/${PORTNAME}-${ELECTRON_VER}/chromium-${CHROMIUM_VER} ${WRKSRC}
	${MV} ${WRKDIR}/${PORTNAME}-${ELECTRON_VER}/${PORTNAME}-${ELECTRON_VER} ${WRKSRC}/electron
	${MV} ${WRKDIR}/${PORTNAME}-${ELECTRON_VER}/${GH_PROJECT_node}-${GH_TAGNAME_node} \
		${WRKSRC}/third_party/${GH_ACCOUNT_node}_${GH_PROJECT_node}
	# ${RMDIR} ${WRKSRC}/electron/vendor/${GH_PROJECT_boto}
	# ${MV} ${WRKDIR}/${PORTNAME}-${ELECTRON_VER}/${GH_PROJECT_boto}-${GH_TAGNAME_boto} \
	# 	${WRKSRC}/electron/vendor/${GH_PROJECT_boto}
	# ${MV} ${WRKDIR}/${PORTNAME}-${ELECTRON_VER}/${GH_PROJECT_pyyaml}-${GH_TAGNAME_pyyaml} \
	# 	${WRKSRC}/electron/vendor/${GH_PROJECT_pyyaml}
	# ${RMDIR} ${WRKSRC}/electron/vendor/${GH_PROJECT_requests}
	# ${MV} ${WRKDIR}/${PORTNAME}-${ELECTRON_VER}/${GH_PROJECT_requests}-${GH_TAGNAME_requests} \
	# 	${WRKSRC}/electron/vendor/${GH_PROJECT_requests}
	${MV} ${WRKDIR}/${PORTNAME}-${ELECTRON_VER}/node_modules ${WRKSRC}/third_party/node
	${MV} ${TMPDIR}/npm-cache/node_modules ${WRKSRC}/electron

post-extract-TEST-on:
	${MV} ${WRKDIR}/${PORTNAME}-${ELECTRON_VER}/test_fonts ${WRKSRC}/third_party/test_fonts

pre-patch:
	${SH} ${FILESDIR}/apply-electron-patches.sh ${WRKSRC}
	# ${FIND} ${WRKSRC} -type f -name '*.orig' -print -delete
	# ${FIND} ${WRKSRC} -type f -name '*~' -print -delete

pre-configure:
	# cd ${WRKSRC}/electron/vendor/${GH_PROJECT_boto} && \
	# 	${PYTHON_CMD} setup.py build
	# cd ${WRKSRC}/electron/vendor/${GH_PROJECT_requests} && \
	# 	${PYTHON_CMD} setup.py build
	# We used to remove bundled libraries to be sure that chromium uses
	# system libraries and not shipped ones.
	# cd ${WRKSRC} && ${PYTHON_CMD} \
	#./build/linux/unbundle/remove_bundled_libraries.py [list of preserved]
	cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} ${PYTHON_CMD} \
		./build/linux/unbundle/replace_gn_files.py --system-libraries \
		ffmpeg flac fontconfig freetype harfbuzz-ng libdrm libjpeg \
		libusb libvpx libwebp libxml libxslt openh264 opus re2 snappy \
		yasm || ${FALSE}

do-configure:
	cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} gn gen out/${BUILDTYPE} \
		--args='import("//electron/build/args/${BUILDTYPE:tl}.gn") ${GN_ARGS}'
	# Setup nodejs dependency
	${MKDIR} ${WRKSRC}/third_party/node/freebsd/node-freebsd-x64/bin
	${LN} -sf ${LOCALBASE}/bin/node ${WRKSRC}/third_party/node/freebsd/node-freebsd-x64/bin/node
	# Setup java dependency
	${MKDIR} ${WRKDIR}/bin
	${LN} -sf ${LOCALBASE}/openjdk8/bin/java ${WRKDIR}/bin/java

# do-build:
# 	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ninja -C out/${BUILDTYPE} ${ALL_TARGET}

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR}
.for f in electron mksnapshot v8_context_snapshot_generator
	${INSTALL_PROGRAM} ${WRKSRC}/out/${BUILDTYPE}/${f} ${STAGEDIR}${DATADIR}
.endfor
.for f in libEGL.so libGLESv2.so libVkICD_mock_icd.so
	${INSTALL_LIB} ${WRKSRC}/out/${BUILDTYPE}/${f} ${STAGEDIR}${DATADIR}
.endfor
	${MKDIR} ${STAGEDIR}${DATADIR}/swiftshader
.for f in libEGL.so libGLESv2.so
	${INSTALL_LIB} ${WRKSRC}/out/${BUILDTYPE}/swiftshader/${f} ${STAGEDIR}${DATADIR}/swiftshader
.endfor
.for f in LICENSES.chromium.html icudtl.dat natives_blob.bin snapshot_blob.bin v8_context_snapshot.bin version
	${INSTALL_DATA} ${WRKSRC}/out/${BUILDTYPE}/${f} ${STAGEDIR}${DATADIR}
.endfor
.for f in chrome_100_percent.pak chrome_200_percent.pak resources.pak
	${INSTALL_DATA} ${WRKSRC}/out/${BUILDTYPE}/${f} ${STAGEDIR}${DATADIR}
.endfor
	${MKDIR} ${STAGEDIR}${DATADIR}/locales
	${INSTALL_DATA} ${WRKSRC}/out/${BUILDTYPE}/locales/*.pak ${STAGEDIR}${DATADIR}/locales
	${MKDIR} ${STAGEDIR}${DATADIR}/resources
.for f in default_app.asar electron.asar
	${INSTALL_DATA} ${WRKSRC}/out/${BUILDTYPE}/resources/${f} ${STAGEDIR}${DATADIR}/resources
.endfor
	cd ${WRKSRC}/out/${BUILDTYPE}/resources/inspector && \
		${COPYTREE_SHARE} . ${STAGEDIR}${DATADIR}/resources/inspector
	${RLN} ${STAGEDIR}${DATADIR}/electron ${STAGEDIR}${PREFIX}/bin

post-install-DRIVER-on:
	${INSTALL_PROGRAM} ${WRKSRC}/out/${BUILDTYPE}/chromedriver ${STAGEDIR}${DATADIR}

do-test-TEST-on:
.for t in ${TEST_ALL_TARGET}
	cd ${WRKSRC}/out/${BUILDTYPE} && ${SETENV} LC_ALL=en_US.UTF-8 \
		./${t} --gtest_filter=-${EXCLUDE_${t}:ts:} || ${TRUE}
.endfor

.include <bsd.port.mk>
