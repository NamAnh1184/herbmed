-- Add image_url column to dim_benh table
ALTER TABLE dim_benh ADD COLUMN IF NOT EXISTS image_url VARCHAR(500);

-- Verify the column was added
SELECT column_name, data_type FROM information_schema.columns 
WHERE table_name = 'dim_benh' AND column_name = 'image_url';
