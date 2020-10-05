package com.counselling_gurus_eng.counselling_gurus

import androidx.annotation.NonNull;
import android.view.WindowManager.LayoutParams;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        getWindow().addFlags(LayoutParams.FLAG_SECURE);
    }
}

//class MainActivity: FlutterActivity() {
//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState);
//        GeneratedPluginRegistrant.registerWith(this);
//    }
//}


//class MainActivity: FlutterActivity() {
//    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//        GeneratedPluginRegistrant.registerWith(flutterEngine);
//    }
//}