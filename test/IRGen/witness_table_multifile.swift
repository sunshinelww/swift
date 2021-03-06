// RUN: %target-swift-frontend -Xllvm -new-mangling-for-tests -assume-parsing-unqualified-ownership-sil -primary-file %s %S/Inputs/witness_table_multifile_2.swift -emit-ir -disable-objc-attr-requires-foundation-module | %FileCheck %s

// CHECK: [[P_WITNESS_TABLE:%[A-Za-z0-9_]+]] = type { [{{24|12}} x i8], %swift.type*, i8** }

// CHECK-LABEL: define hidden swiftcc void @_T023witness_table_multifile3baryyF
func bar() {
  // CHECK: call swiftcc void @_T023witness_table_multifile2goAA1P_pyF
  // CHECK:  [[BUFFER:%[0-9]+]] = call %swift.opaque* %projectBuffer
  // CHECK-NEXT:  [[WITNESS_TABLE_ADDR:%[0-9]+]] = getelementptr inbounds [[P_WITNESS_TABLE]], [[P_WITNESS_TABLE]]* %0, i32 0, i32 2
  // CHECK-NEXT:  [[WITNESS_TABLE:%[A-Za-z0-9_-]+]] = load i8**, i8*** [[WITNESS_TABLE_ADDR]]
  // CHECK-NEXT: getelementptr inbounds i8*, i8** [[WITNESS_TABLE]], i32 3
  go().foo()
}
