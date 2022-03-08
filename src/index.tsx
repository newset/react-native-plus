import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-plus' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const RNPlus = NativeModules.RNPlus
  ? NativeModules.RNPlus
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function navigate(module: string, route: string) {
  RNPlus.navigate(module, route);
}
