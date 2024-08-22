import {
  FlutterPlugin,
  FlutterPluginBinding,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult,
} from '@ohos/flutter_ohos';
import window from '@ohos.window';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';

/** PrivacyWindowPlugin **/
export default class PrivacyWindowPlugin implements FlutterPlugin, MethodCallHandler {
  private channel: MethodChannel | null = null;

  constructor() {
  }

  getUniqueClassName(): string {
    return "PrivacyWindowPlugin"
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    this.channel = new MethodChannel(binding.getBinaryMessenger(), "f_privacy_window");
    this.channel.setMethodCallHandler(this)
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    if (this.channel != null) {
      this.channel.setMethodCallHandler(null)
    }
  }

  onMethodCall(call: MethodCall, result: MethodResult): void {
    if (call.method == "setPrivacyWindow") {
      this.setPrivateWindow();
    } else if (call.method == "unSetPrivacyWindow") {
      this.unSetPrivateWindow();
    } else {
      result.notImplemented()
    }
  }

  private async getMainWindow(): Promise<window.Window> {
    let context = getContext(this) as common.UIAbilityContext;
    return new Promise((resolve, reject) => {
      window.getLastWindow(context as common.UIAbilityContext, (err, data) => {
        if (err) {
          reject(err);
        } else {
          resolve(data);
        }
      });
    });
  }

  private setWindowPrivacyMode(isPrivacyMode: boolean): void {
    this.getMainWindow()
      .then(windowClass => {
        windowClass.setWindowPrivacyMode(isPrivacyMode, (err: BusinessError) => {
          if (err) {
            throw new Error(`Failed to set the window to privacy mode. Error code: ${err.code}, Details: ${JSON.stringify(err)}`);
          }
          console.info('Succeeded in setting the window to privacy mode.');
        });
      })
  }

  setPrivateWindow(): void {
    this.setWindowPrivacyMode(true);
  }

  unSetPrivateWindow(): void {
    this.setWindowPrivacyMode(false);
  }
}
