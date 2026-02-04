package kda.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class KdaHtmlUtil {
	
	private static interface Patterns {
		public static final Pattern SCRIPTS = Pattern.compile(
				"<(no)?script[^>]*>.*?</(no)?script>", Pattern.DOTALL);
		public static final Pattern STYLE = Pattern.compile(
				"<style[^>]*>.*</style>", Pattern.DOTALL);
		public static final Pattern TAGS = Pattern
				.compile("<(\"[^\"]*\"|\'[^\']*\'|[^\'\">])*>");
		public static final Pattern nTAGS = Pattern
				.compile("<\\w+\\s+[^<]*\\s*>");
		public static final Pattern ENTITY_REFS = Pattern.compile("&[^;]+;");
		public static final Pattern WHITESPACE = Pattern.compile("\\s\\s+");
		public final static Pattern IMG_SRC_PATTERN = Pattern
				.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
	}

	public static String convText(String html) {
		if (html == null) {
			return "";
		}
		return html.replaceAll("<", "&lt;");
	}

	public static String convHTML(String text) {
		if (text == null)
			return "";
		return text.replaceAll("&lt;", "<").replaceAll("\n", "<br>");
	}

	public static List<String> getImageSrcs(String html) {
		List<String> result = new ArrayList<String>();
		Matcher matcher = Patterns.IMG_SRC_PATTERN.matcher(html);
		while (matcher.find()) {
			result.add(matcher.group(1));
		}
		return result;

	}

	public static String clean(String html) {
		if (html == null) {
			return null;
		}

		Matcher matcher;
		matcher = Patterns.SCRIPTS.matcher(html);
		html = matcher.replaceAll("");

		matcher = Patterns.STYLE.matcher(html);
		html = matcher.replaceAll("");

		matcher = Patterns.TAGS.matcher(html);
		html = matcher.replaceAll("");

		matcher = Patterns.ENTITY_REFS.matcher(html);
		html = matcher.replaceAll("");

		matcher = Patterns.WHITESPACE.matcher(html);
		html = matcher.replaceAll(" ");

		return html;
	}
}
