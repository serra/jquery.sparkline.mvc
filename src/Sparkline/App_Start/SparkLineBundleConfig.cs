using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;

namespace SparklineSupport
{
    public class SparklineBundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/sparkline").Include(
                "~/Scripts/jquery-1.*",
                "~/Scripts/jquery.sparkline.js"
                ));
        }
    }
}