java -agentlib:native-image-agent=config-output-dir=native-config \
     -Djruby.home=`pwd` -Djruby.native.enabled=false \
     -Djruby.debug.parser -cp lib/jruby.jar \
     org.jruby.main.NativeMain -e 1

native-image --no-server -Djruby.debug.parser=true -Djruby.reify.variables=false \
             -Djruby.home=`pwd` -Djruby.native.enabled=false -Djruby.graavm.native.compile --no-fallback \
             --report-unsupported-elements-at-runtime \
             --initialize-at-build-time=com.headius.backport9.stack.StackWalker,com.headius.backport9.stack.impl.StackWalker8,com.headius.invokebinder.Signature,org.jruby.NativeImageClassInitializer,org.jcodings.specific.EUCJPEncoding,org.jcodings.specific.SJISEncoding,org.jcodings.specific.UTF8Encoding,org.jcodings.specific.ASCIIEncoding,org.jcodings.specific.USASCIIEncoding,org.jcodings.specific.ISO8859_1Encoding,org.jcodings.specific.EmacsMuleEncoding,org.jcodings.specific.UTF16BEEncoding,org.jcodings.util,org.jruby.util.log.StandardErrorLogger,org.jcodings.ascii.AsciiTables,org.jruby,org.jruby.runtime.EventHook,org.jruby.util.cli.Options,com.headius.options,org.jruby.RubyInstanceConfig,org.jruby.util.SafePropertyAccessor,org.jcodings.specific.UTF32LEEncoding,org.jcodings.specific.UTF32BEEncoding,org.jcodings.specific.UTF16LEEncoding,org.joda.time,org.joda.time.format,org.joni,org.jcodings.EncodingDB,org.joni.Analyser,org.jcodings.IntHolder,org.joni.Parser,jnr.constants.platform.OpenFlags,jnr.constants.platform.ConstantResolver,jnr.posix.util.Platform,org.joni.Lexer,org.joni.ScannerSupport,org.jcodings.transcode.EConvResult,org.jcodings.ObjPtr,jnr.constants,org.jcodings,org.jruby.gen,org.jruby,org.jcodings.unicode,org.jcodings.transcode.specific,jnr.posix.JavaPOSIX,jnr.posix.JavaLibCHelper,org.jruby.util.NormalizedFile,jnr.posix.POSIXFactory,jnr.posix.JavaSecuredFile,jnr.posix.JavaLibCHelper,com.headius.backport9.buffer.Buffers,jnr.posix,jnr.ffi.Platform,jnr.ffi.Platform\$SingletonHolder,jnr.ffi.Platform\$Darwin,jnr.ffi.Platform\$1,org.joda.time.tz.data.America.Chicago,org.jruby.gen.org\$jruby\$RubyBasicObject\$POPULATOR,com.headius.backport9.modules.impl.ModuleDummy,org.jruby.main.NativeMain -H:+TraceClassInitialization -H:ReflectionConfigurationFiles=native-config/reflect-config.json -H:ResourceConfigurationFiles=native-config/resource-config.json \
             --allow-incomplete-classpath --verbose -cp lib/jruby.jar \
             org.jruby.main.NativeMain
