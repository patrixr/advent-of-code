(ns aoc.core
  (:gen-class))

(require '[clojure.string :as st])

(defrecord Num [value pos])
(defrecord Gear [pos])

(def input (slurp "./input-day-3.txt"))
(def lines (clojure.string/split-lines input))
(def w (count (first lines)))
(def h (count lines))

(defn is-num [str] (re-matches #"\d+" str))
(defn is-empty [str] (re-matches #"\.+" str))
(defn is-gear [str] (re-matches #"[^\d\.]+" str))

(defn xy [x y]
  (nth (nth lines y) x))

(defn each-xy []
  (for [x (range w)
        y (range h)]
    [x y]))

(defn chunkify [str]
  (map #(clojure.string/split % #"(?<=\.)(?=[^\.])|(?<=[^\.])(?=\.)") str))

(defn process-chunks
  ([chunks] (process-chunks chunks [] [] 0))
  ([chunks nums gears pos]
   (cond
     (empty chunks) [num, gears]
     :else
     (let [
           chunk (first chunks)
           next-pos (+ pos (count chunk))
           rest (drop 1 chunks)
          ]
       (cond
         (is-empty chunk) (process-chunks rest nums gears next-pos)
         (is-gear chunk) (process-chunks rest nums (conj gears (->Gear pos)) next-pos)
         (is-num chunk) (process-chunks rest (conj nums (->Num (num chunk) pos)) gears next-pos))))))
     
(defn read-chunks [rows]
  (doseq [y (range (count rows))]
    (let [row (nth rows y)]
      (loop [chunks (first row), pos 0]
        (let [chunk (first chunks)]
          (when (is-gear chunk)
            
            )
          (recur (drop 1 chunks)
                 (+ pos (count chunk))))))))

(defn -main []
  (->> lines
     (chunkify)
     (read-chunks)))
