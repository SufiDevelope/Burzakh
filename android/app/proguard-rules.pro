-keep class **.zego.** { *; }

-keep class com.itgsa.opensdk.** { *; }

-keep class java.beans.** { *; }

-keep class com.fasterxml.jackson.databind.** { *; }

-keep class org.w3c.dom.** { *; }

-keep class org.conscrypt.** { *; }

-keepattributes *Annotation*
-keepattributes Signature
-keepattributes EnclosingMethod

-dontwarn org.conscrypt.**
-dontwarn java.beans.**
-dontwarn com.fasterxml.jackson.databind.**
-dontwarn com.itgsa.opensdk.**
-dontwarn org.w3c.dom.**
