SELECT show_id, "type", title, director, "cast", country, date_added, 
release_year, rating, duration, listed_in, description,
genre, country_1, date_added_parsed
FROM public.netflix_titles_grup4;


---Ülkelere göre içerik dağılımı
SELECT 
    COALESCE(country, 'unknown') AS country,
    COUNT(*) AS content_count
FROM public.netflix_titles_grup4
GROUP BY COALESCE(country, 'unknown')
ORDER BY content_count DESC;


---Belirli türlerdeki (ör. “Drama”) içerikleri ve üretim yıllarını listele.
SELECT 
    title,
    release_year,
    listed_in
FROM public.netflix_titles_grup4
WHERE listed_in ILIKE '%Drama%'
ORDER BY release_year DESC;


---En çok yönetmenliği yapılan türleri bul.
SELECT 
    listed_in,
    COUNT(director) AS director_count
FROM public.netflix_titles_grup4
WHERE director IS NOT NULL 
GROUP BY listed_in
ORDER BY director_count DESC;



---Ülkelere göre trend video sayısı.
SELECT
    COALESCE(country, 'unknown') AS country,
    COUNT(*) AS trend_video_count
FROM public.netflix_titles_grup4
WHERE listed_in ILIKE '%TV Shows%'
GROUP BY COALESCE(country, 'unknown')
ORDER BY trend_video_count DESC;
