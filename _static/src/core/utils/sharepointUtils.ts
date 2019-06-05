import * as SPScript from "spscript";

export function checkIsSharePointLink(url: string) {
  return url && url.search(/\.sharepoint\.com/i) > -1;
}
declare global {
  interface Window {
    __portalsDev: {
      siteUrl: string;
      webUrl: string;
    };
  }
}

export function getSiteUrl(url?: string) {
  if (!url && window.__portalsDev) {
    return window.__portalsDev.siteUrl;
  }
  url = (url || window.location.href).toLowerCase();
  let managedPathIndex = url.search(/\/sites\/|\/teams\//i);
  if (!checkIsSharePointLink(url) || managedPathIndex < 0) return null;
  let siteUrl = url;
  let trailingCharIndexes = [
    url.indexOf("/", managedPathIndex + 7),
    url.indexOf("?", managedPathIndex + 7),
    url.indexOf("#", managedPathIndex + 7),
  ].filter(i => i > -1);
  let targetIndex = Math.min(...trailingCharIndexes);
  if (targetIndex > -1) {
    siteUrl = url.substring(0, targetIndex);
  }
  return siteUrl;
}

export function getTenant(url?: string) {
  if (!url) url = window.location.href;
  url = url.toLowerCase();
  if (!checkIsSharePointLink(url)) return null;

  let sharepointIndex = url.indexOf(".sharepoint");
  // Substring, start after https://, and at the '.sharepoint'
  let subdomain = url.substring(8, sharepointIndex);
  // support stuff like https://mytenant-admin.sharepoint.com and https://mytenant-my.sharepoint.com

  return subdomain.split("-")[0];
}

export async function checkListExists(siteUrl: string, listName: string) {
  try {
    let ctx = SPScript.createContext(siteUrl);
    let listInfo = await ctx.lists(listName).getInfo();
    return true;
  } catch (err) {
    return false;
  }
}
