import { createContext } from 'react';

export const AppContext = createContext({
  slowQuery: false,
  isPreAggregationBuildInProgress: false,
});

export { default as useDeepCompareMemoize } from './deep-compare-memoize';
export { default as useSecurityContext } from './security-context';
export { default as useCubejsApi } from './cubejs-api';
